From Coq Require Import Arith.PeanoNat.

(* Seed-family replay: extended nonnegative quantities.
   We use nat and option nat as a lightweight constructive stand-in for the
   order/partiality obligations that appear in extended nonnegative reals. *)

Inductive ennat_rel : nat -> option nat -> Prop :=
| ennat_rel_finite : forall n, ennat_rel n (Some n).

Definition le_option_nat (x y : option nat) : Prop :=
  match x, y with
  | Some a, Some b => a <= b
  | Some _, None => True
  | None, Some _ => False
  | None, None => True
  end.

Lemma ennat_le_transfer :
  forall a b ax bx,
    ennat_rel a ax ->
    ennat_rel b bx ->
    a <= b ->
    le_option_nat ax bx.
Proof.
  intros a b ax bx Ha Hb Hle.
  inversion Ha; subst.
  inversion Hb; subst.
  simpl.
  exact Hle.
Qed.

Lemma ennat_plus_transfer :
  forall a b ax bx,
    ennat_rel a ax ->
    ennat_rel b bx ->
    ennat_rel (a + b)
      (match ax, bx with
       | Some x, Some y => Some (x + y)
       | _, _ => None
       end).
Proof.
  intros a b ax bx Ha Hb.
  inversion Ha; subst.
  inversion Hb; subst.
  constructor.
Qed.

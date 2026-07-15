(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_040.
Definition enc_40 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_40 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_40 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_40 : forall o : option nat, dec_40 (enc_40 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_40 : forall o : option nat, enc_40 o = size_40 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_40 : forall o : option nat, enc_40 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_040.


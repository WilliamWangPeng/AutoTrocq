(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_066.
Definition enc_66 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_66 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_66 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_66 : forall o : option nat, dec_66 (enc_66 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_66 : forall o : option nat, enc_66 o = size_66 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_66 : forall o : option nat, enc_66 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_066.


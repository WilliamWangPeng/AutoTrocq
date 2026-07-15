(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_038.
Definition enc_38 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_38 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_38 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_38 : forall o : option nat, dec_38 (enc_38 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_38 : forall o : option nat, enc_38 o = size_38 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_38 : forall o : option nat, enc_38 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_038.

